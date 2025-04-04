# Best Practices and Learnings

## Table of Contents
1. [Architecture & Setup](#architecture--setup)
2. [Frontend Best Practices](#frontend-best-practices)
3. [Backend Best Practices](#backend-best-practices)
4. [OpenAI Integration Patterns](#openai-integration-patterns)
5. [Error Handling & Debugging](#error-handling--debugging)
6. [Development Tips](#development-tips)

## Architecture & Setup

### Project Structure
```
.
├── frontend/           # React TypeScript frontend
│   ├── src/
│   │   ├── components/    # React components
│   │   └── types/        # TypeScript type definitions
│   └── package.json
└── backend/           # Flask Python backend
    ├── app.py        # Main Flask application
    └── requirements.txt
```

### Key Setup Considerations
- Clean separation between frontend and backend
- Use of modern tech stack: React TS, Tailwind CSS, Flask, OpenAI API
- Environment variables for sensitive data
- Clear documentation in README.md

## Frontend Best Practices

### TypeScript & Component Structure
- Strong typing with dedicated types directory
- Component-based architecture
- Clean separation of concerns

### UI/UX Considerations
```typescript
// Example of good loading state handling
const [isSubmitting, setIsSubmitting] = useState(false);
const [showSuccess, setShowSuccess] = useState(false);

<button
    disabled={isSubmitting}
    className="px-4 py-2 bg-primary disabled:opacity-50
              hover:bg-primary-dark transition-colors"
>
    {isSubmitting ? (
        <span className="flex items-center space-x-2">
            <LoadingSpinner />
            <span>Processing...</span>
        </span>
    ) : 'Submit'}
</button>
```

### CSS & Styling
- Use Tailwind CSS for rapid development
- Consistent color scheme
- Responsive design patterns
- Smart use of transitions and animations

## Backend Best Practices

### Flask Setup
```python
from flask import Flask, request, jsonify
from flask_cors import CORS
import logging

app = Flask(__name__)
CORS(app, resources={r"/api/*": {"origins": "*"}})

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)
```

### API Structure
- RESTful endpoints
- Clear error handling
- Request validation with Pydantic
- Comprehensive logging

## OpenAI Integration Patterns

### Structured Output with Pydantic
```python
from pydantic import BaseModel
from typing import List
from openai import OpenAI

class RiskAssessment(BaseModel):
    risk_level: str
    risk_score: float
    findings: List[str]
    recommendations: List[str]
    narrative: str

client = OpenAI(api_key=os.getenv('OPENAI_API_KEY'))

try:
    completion = client.beta.chat.completions.parse(
        model="gpt-4o-mini",
        messages=[
            {"role": "system", "content": "You are a Data Protection Officer assistant..."},
            {"role": "user", "content": f"Analyze these responses: {str(data)}"}
        ],
        response_format=RiskAssessment,
    )
    
    assessment_data = completion.choices[0].message.parsed.model_dump()
except Exception as e:
    logger.error(f"[{request_id}] Error: {str(e)}")
```

### Error Handling and Logging
```python
request_id = datetime.now().strftime('%Y%m%d-%H%M%S-%f')
logger.info(f"[{request_id}] New request received")

try:
    # OpenAI API call
    logger.info(f"[{request_id}] Sending request to OpenAI")
    # ... API call ...
except Exception as e:
    error_msg = str(e)
    logger.error(f"[{request_id}] Error: {error_msg}")
    return jsonify({"error": error_msg}), 500
```

## Error Handling & Debugging

### Frontend Error Handling
```typescript
const handleSubmit = async () => {
    setIsSubmitting(true);
    try {
        const response = await fetch('http://127.0.0.1:5000/api/assess', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(responses),
        });

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const data = await response.json();
        setAssessment(data);
    } catch (error) {
        console.error('Error:', error);
        setError(error.message);
    } finally {
        setIsSubmitting(false);
    }
};
```

### Backend Error Handling
- Use request IDs for tracing
- Proper HTTP status codes
- Structured error responses
- Comprehensive logging

## Development Tips

### Local Development
- Use `127.0.0.1` instead of `localhost` for reliable local development
- Proper CORS configuration for development
- Environment-specific configurations

### Security Considerations
- API key management through environment variables
- Input validation
- Proper error handling to prevent information leakage
- CORS configuration

### Testing & Debugging
- Clear logging patterns
- Request tracing with IDs
- Type safety throughout
- Error boundary implementation

## Key Takeaways

1. Always use TypeScript for frontend development
2. Implement proper loading states and error handling
3. Use Pydantic for request/response validation
4. Maintain comprehensive logging
5. Use `127.0.0.1` instead of `localhost` for development
6. Keep documentation updated
7. Consider UX from the start
8. Implement proper type safety
9. Use environment variables for sensitive data
10. Maintain clean architecture and separation of concerns

## Common Pitfalls to Avoid

1. Insufficient error handling
2. Missing loading states
3. Inadequate type definitions
4. Poor logging practices
5. Inconsistent error responses
6. Lack of proper CORS configuration
7. Missing documentation
8. Insufficient input validation
9. Poor separation of concerns 